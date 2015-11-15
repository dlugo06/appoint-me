class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy, :notify]
  skip_before_action :verify_authenticity_token, only: [:notify]
  # before_action :set_appointment, only: [:new, :create]


  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    def pm_or_am
      if @notification.time.hour < 12
        return "AM"
      else
        return "PM"
      end
    end
    message_content = "Your notification will happen on #{@notification.time.month}/#{@notification.time.day}/#{@notification.time.year} at #{@notification.time.hour}:#{@notification.time.min} #{pm_or_am}."
    client.messages.create from: '7603137138', to: current_user.phone_number, body: message_content
    redirect_to appointment_notifications_path(@notification.appointment), notice: 'Text was successfully sent.'
  end
  # GET /notifications
  # GET /notifications.json
  def index
    if current_user.admin?
      @notifications = Notification.all
    else
      # redirect_to appointments_path
      @notifications = current_user.notifications
    end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @appointment = Appointment.find(params[:id])
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to appointment_notifications_path(@notification.appointment), notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:time, :notification_type, :user_id, :appointment_id)
    end
end
