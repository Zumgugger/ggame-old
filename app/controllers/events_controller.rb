class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @title = "Events"
  end
    
  def main
    @events = Event.last(12)
    @groups = Group.order(:name).all[1..-1].sort! {|a,b| a.points <=> b.points}.reverse
    @title = "Control Room"
    @targets = Target.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @groups = Group.all.order(:name)
    @options = Option.all
    @targets = Target.all.order(:name)
  end

  # GET /events/1/edit
  def edit
    @groups = Group.all.order(:name)
    @options = Option.all
    @targets = Target.all.order(:name)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.time = Time.now
    @event.group_points = 0
    @group =  Group.find(event_params[:group_id])
    @target = Target.find(event_params[:target_id]) if event_params[:target_id]
    @target_group = Group.find(event_params[:target_group_id]) if event_params[:target_group_id]
    
    if  @event.option.name == "hat Posten geholt"
            @last_time = Event.where(option: @event.option, group: @group, target: @target).last
         if @last_time
             @event.group_points = 0 
             @event.description = "schon geholt"
             puts "="
             puts @last_time
         else
            @event.group_points =   @target.points + @target.mines
            @event.group_points += 100 if @target.count ==  0
            @event.description = "Boom! #{@target.mines}" if @target.mines != 0
            @target.mines = 0
            @target.count += 1
         end
        
    elsif @event.option.name == "hat Mine gesetzt"
        if @event.group.points < @event.points_set
            @event.description = "zu teuer"
            @event.group_points = 0
        else
            @event.group_points =   - @event.points_set
            @target.mines += 2*@event.group_points
        end
        
    elsif @event.option.name == "hat Gruppe fotografiert"
        @last_foto_event = Event.where(option: @event.option, target_group: @group, group: @target_group).last
        @last_foto = Event.where(option: @event.option, target_group: @target_group, group: @group).last
        @time = @time2 = Time.now - 100.minutes 
            
        if @last_foto_event
        @time = @last_foto_event.time
        end
        if @last_foto
        @time2 = @last_foto.time
        end
            if @event.group == @event.target_group
                @event.description = "eigene Gruppe"
                @event.group_points = 0
                @event.target_points = 0 
            elsif (@time + 60.minutes > Time.now || @time2 + 60.minutes > Time.now)
                @event.description = "zu früh"
                @event.group_points = 0
                @event.target_points = 0
            else
                @event.group_points = 400
                @event.target_points = -400
                @target_group.points += @event.target_points
            end
        
        
    elsif @event.option.name == "hat sondiert"
        if @event.group.points < 50
            @event.description = "zu teuer"
            @event.group_points = 0
        else
            @event.group_points = -50
            @event.description = "Mine vorhanden" if @target.mines != 0 
        end
        
    elsif @event.option.name =="hat spioniert"
        if @event.group.points < 50
            @event.description = "zu teuer"
            @event.group_points = 0
        elsif @event.group == @event.target_group
            @event.description = "eigene Gruppe"
            @event.group_points = 0
        else
            @event.group_points = -50
            @event.description = "Spionage!"
        end
        
        
        
    elsif @event.option.name == "hat Foto bemerkt"
        @option = Option.where(name: "hat Gruppe fotografiert")
        @last_foto_event = Event.where(option: @option, target_group: @group, group: @target_group).last
        @time = Time.now - 100.minutes 
            
        if @last_foto_event
        @time = @last_foto_event.time
        end
        if @group == @target_group
            @event.description = "eigene Gruppe"
            @event.group_points = 0
            @event.target_points = 0
        elsif @time + 600.seconds < Time.now
            @event.description = "zu spät bzw. falsche Gruppe"
            @event.group_points = 0
            @event.target_points = 0
        else
            @event.group_points = 200
            @event.target_points = -200
            @target_group.points += @event.target_points
        end
    end 
      
         
    @group.points += @event.group_points
    @target.last_action = Time.now
        
    @groups = Group.all.order(:name)
    @options = Option.all.order(:name)
    @targets = Target.all.order(:name)
      
    

    respond_to do |format|
      if @event.save
        @group.save if @group.name != 0 
        @target_group.save
        @target.save
        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @groups = Group.all.order(:name)
    @options = Option.all
    @targets = Target.all.order(:name)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:time, :group_id, :option_id, :noticed, :points_set, :target_group_id, :target_id, :description)
    end
    
    
end
