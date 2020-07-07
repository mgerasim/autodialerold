namespace :blf do
  desc "TODO"
  task sps: :environment do
    puts "blf:sps"
   
    setting = Setting.first

    exit if setting.autosps == false

    puts "blf:sps: check updating" 

    blves = Blf.all
    sps = 45
    case  Blf.where(:status => "hangup").count
      when 1
        sps = 15
      when 2
        sps = 20
      when 3
        sps = 25
    end  

    exit if sps == setting.callcount

    puts "update to #{sps}"

    setting.update_attributes(:callcount => sps)

  end

  desc "TODO"
  task stat: :environment do

    Statsp.where('created_at <= ?', 1.day.ago.to_datetime) do |statsp| 
      statsp.delete
    end 

    sps = 45
    case  Blf.where(:status => "hangup").count
    when 1
      sps = 15
    when 2
      sps = 20
    when 3
      @sps = 25
    end


    Statsp.create(:countreg => Blf.count, :freeoper => Blf.where(:status => "hangup").count, :newsps => sps, :abonqueue => Channel.count)
  end

end
