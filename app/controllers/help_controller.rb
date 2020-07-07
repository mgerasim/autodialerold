class HelpController < ApplicationController

  skip_before_action :require_login, :only => [:blves, :channel_add, :channel_del]

  def cdr
    send_file(
        "/var/log/asterisk/cdr-csv/Master.csv",
        filename: "Master.csv",
        type: "text/csv"
    )
  end

  def cdr_clear
    `rm -rf /var/log/asterisk/cdr-csv`
    `mkdir /var/log/asterisk/cdr-csv`
    `> /var/log/asterisk/cdr-custom/Master.csv`
    redirect_to outgoings_url, notice: 'Очистка журналов выполнено успешно'
  end

  def outgoing_destroy_all
    OutgoingDestroyAllJob.perform_later( )
    respond_to do |format|
      format.html { redirect_to outgoings_url, notice: 'Outgoing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def channel_add
    uuid = params[:uuid]
    Channel.create(:uuid => uuid)
    render :layout => false
  end

  def channel_del
    uuid = params[:uuid]
    Channel.where(:uuid => uuid).each do |channel| 
      channel.delete
    end
    render :layout => false
  end

  def blves
    uid = params[:uid]
    status = params[:status]
    direction = params[:direction]
    other_leg = params[:other_leg]
    other_leg_domain = params[:other_leg_domain]
    rank = params[:rank]
    uuid = params[:uuid]   

    blf = Blf.where(:uid => uid).first
    if (blf == nil)
       blf = Blf.new
    end

    if (uid.to_i < 1000 and status != "unregistered")
      blf.uid = uid
      blf.status = status
      blf.direction = direction
      blf.other_leg = other_leg
      blf.other_leg_domain = other_leg_domain
      blf.rank = rank
      blf.uuid = uuid

      blf.save
    end

    render :layout => false
  end

end
