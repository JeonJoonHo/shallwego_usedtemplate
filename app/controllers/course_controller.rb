class CourseController < ApplicationController

  ##CREATE
  def course_new
  end

  def create
    @user = User.find(current_user.id)
    @course = @user.courses.new(title: params[:title],content: params[:content], limit_person: params[:limitPerson], start_date: params[:startDate], end_date: params[:endDate])
    @course.save
    @pictures = params[:imgs]
    @p = []
    @pictures.each do |img|
      @p << @course.pictures.new(image: img)
    end
    @p.each(&:save)

    @place_ids = params[:place_ids]
    @place_names = params[:place_names]
    @timings = params[:timings]
    @events = params[:events]
    @place_ids_split = @place_ids.split(',')
    @place_names_split = @place_names.split(',')
    @timings_split = @timings.split(',')
    @events_split = @events.split(',')
    @locations = @place_ids_split.zip(@place_names_split,@timings_split,@events_split)

    @l =[]
    @locations.each do |l_i,l_n,t,e|
      @l<< @course.locations.new(place_id: l_i, name: l_n, timing: t,event: e)
    end
    @l.each(&:save)

    redirect_to '/course/course_list'
  end

  ##READ
  def course_list
    @courses = Course.all
  end

  def course_detail
    @course = Course.find(params[:id])
  end

  ##UPDATE
  def course_edit
    @course = Course.find(params[:id])

  end

  def update

  end

  ##DELETE
  def destroy
    Course.destroy(params[:id])

    redirect_to :back
  end

end
