namespace :dial do
 
  pid_file = "/tmp/#{ENV['RAILS_ENV']}_dial_run.pid"
       
  desc "TODO"
  task clear: :environment do
    `rm -rf /var/log/asterisk/cdr-csv/`
    `mkdir /var/log/asterisk/cdr-csv/`
  end

  desc "Stop dial"
  task stop: :environment do
    Process.kill(9, File.read(pid_file).to_i)  if File.exist?(pid_file)
    File.delete(pid_file) if File.exist?(pid_file)
  end

  desc "TODO"
  task incommings: :environment do
    setting = Setting.first
    
    setting.update_attributes(:prev_outgoing_count => Outcount.where("created_at > ?", 1.hour.ago.to_datetime).sum(:count))
    setting.update_attributes(:prev_incomming_count => Asteriskcdr.where("calldate > ? AND dcontext like '%in%'", 1.hour.ago.to_datetime).count)

    setting.update_attributes(:outgoing_count_24h => Outcount.where("created_at > ?", 24.hour.ago.to_datetime).sum(:count))
    setting.update_attributes(:ingoing_count_24h => Asteriskcdr.where("calldate > ? AND dcontext like '%in%'", 24.hour.ago.to_datetime).count)
      
    Incomming.where('created_at <= ?', 25.hour.ago.to_datetime) do |incomming| 
      incomming.delete
    end 
    Outcount.where('created_at <= ?', 25.hour.ago.to_datetime) do |out| 
      out.delete
    end 
  end

  desc "TODO"
  task run: :environment do

	  begin

		  if File.exists? pid_file
      pid = File.read(pid_file).to_i

      begin
        Process.getpgid( pid )
        check_pid = true
      rescue Errno::ESRCH
        check_pid = false
      end

      File.delete(pid_file) if check_pid == false

    end



    if !File.exists? pid_file 

    File.open(pid_file, 'w') { |f| f.puts Process.pid }

    task_start_time = Time.now

    puts Time.now.strftime("  %F %T")
    
    wc1 = `ps aux | grep -i "rake dial:run" | grep -v "grep" | wc -l`.split("\n")
    
    setting = Setting.first
    total = (40 / setting.sleep).floor
   
    totalconfig = Totalconfig.first

#    for t in 0..total 
loop do
	setting = Setting.first

	totalconfig = Totalconfig.first 
      
       puts Time.now.strftime("    %F %T")
        
        sleep setting.sleep
        
        wc = `ps aux | grep -i "rake dial:run" | grep -v "grep" | wc -l`.split("\n")
        
        puts wc
	puts wc1
       
        next if (wc == 2 and wc1 == 2)
        
        next if (setting.is_enabled != true)
        dir = '/var/spool/asterisk/outgoing/'
        count = Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
        j = count
	puts setting.callcount
	puts count        
#        next   if (count > setting.callcount)
       
        n = 0
       
        Outgoing.limit(setting.callcount).each do |contact|
            contact.delete
            n = n + 1
            j = j + 1
            f_path = ""
            peers_str = setting.sipnames
            peers = peers_str.split('|')
            i = contact.id % peers.count
            telephone = contact.telephone.gsub(/[^0-9A-Za-z]/, '').gsub(/\r\n?/, "\n").gsub(/\W/, '') 
                      
            if (telephone.length == 11)
                telephone.slice!(0)
            end
    
            if (telephone.length == 10) 
              telephone = '7' + telephone
            end
            
            puts telephone

            if (totalconfig.is_random_peer) 
              i = rand(0..peers.count - 1)
            end

            template_channel = "PJSIP"

            if (totalconfig.template_channel != nil) 
              template_channel = totalconfig.template_channel
            end

            File.open(Dir::Tmpname.create(['tmp_' + peers[i] + '_', '.call'], '/var/spool/asterisk/tmp') { }.to_s, "w+") do |f|
              f.chmod(0777)
#              f.puts("Channel: " + template_channel + "/" + telephone + "@" + peers[i])
  	      f.puts("Channel: " + template_channel + "/" + telephone + "@" + peers[i])
	      f.puts("Callerid: " + peers[i])
   #          f.puts("Account: " + telephone)
              f.puts("MaxRetries: 0")
              f.puts("RetryTime: 20")
              f.puts("WaitTime: " + setting.duration.to_s)
	      f.puts("Context: NO_CONTEXT")
              f.puts("Extension:s")
              f.puts("Priority:1")
	      f.puts("AlwaysDelete:Yes")
              f.puts("Archive:No")
 #             f.puts("Set: CDR(num)=" + telephone)
 	      f.puts("Setvar: __WAITTIME=" + setting.duration.to_s)

              f_path = f.path
            end
            FileUtils.mv(f_path, '/var/spool/asterisk/outgoing/' + File.basename(f_path))
       
            dir = '/var/spool/asterisk/outgoing/'
            count = Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
       
              
            #if (j > setting.callcount)
            #  j = 0
            #  next
            #end
        end
        
        Outcount.create(:count => n) if n > 0
	
   # end

 #  rescue => error

#	    File.delete(pid_file) if File.exist?(pid_file)

#   end

    end # for

    task_end_time = Time.now

    task_elapsed_seconds = task_end_time.to_i - task_start_time.to_i  # ((task_end_time - task_start_time) * 24 * 60 * 60).to_i

    File.open('/tmp/task_end_time.sec', 'w') { |f| f.puts task_elapsed_seconds}

    end
    rescue => error
	    
	    File.delete(pid_file) if File.exist?(pid_file)
	    puts "Rescued: #{error.inspect}"
    end

    
  end

end
