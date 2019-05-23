namespace :blf do
  desc "TODO"
  task sps: :environment do
    puts "blf:sps"
   
    setting = Setting.first

    puts setting.autosps

    exit if setting.autosps == false

    puts "blf:sps: updating" 

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

    setting.update_attributes(:autosps => setting.callcount)

  end

end
