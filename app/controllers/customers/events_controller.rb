class Account::EventsController < Account::ApplicationController
  account_load_and_authorize_resource :event, through: :team, through_association: :events

  # GET /customers/teams/:team_id/events
  # GET /customers/teams/:team_id/events.json
  def index
    delegate_json_to_api
  end

  # GET /customers/events/:id
  # GET /customers/events/:id.json
  def show
    delegate_json_to_api
  end

  # GET /customers/teams/:team_id/events/new
  def new
  end

  # GET /customers/events/:id/edit
  def edit
  end

  # POST /customers/teams/:team_id/events
  # POST /customers/teams/:team_id/events.json
  def create
    respond_to do |format|
      if @event.save
        format.html { redirect_to [:customers, @team, :events], notice: I18n.t("events.notifications.created") }
        format.json { render :show, status: :created, location: [:customers, @event] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/events/:id
  # PATCH/PUT /customers/events/:id.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:customers, @event], notice: I18n.t("events.notifications.updated") }
        format.json { render :show, status: :ok, location: [:customers, @event] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/events/:id
  # DELETE /customers/events/:id.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to [:customers, @team, :events], notice: I18n.t("events.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  if defined?(Api::V1::ApplicationController)
    include strong_parameters_from_api
  end

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
