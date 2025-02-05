class DevelopersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :set_developer, only: [:edit, :update]

    def index
        @developers = Developer.joins(:user).where.not(users: { confirmed_at: nil })
        # Apply filters if parameters are present
        @developers = @developers.where("key_skills ILIKE ?", "%#{params[:skill]}%") if params[:skill].present?
        @developers = @developers.where(city: params[:city]) if params[:city].present?
        @developers = @developers.where(country: params[:country]) if params[:country].present?
        @developers = @developers.where("experience_years >= ?", params[:experience].to_i) if params[:experience].present?
        @developers = @developers.where(available_for_mentorship: true) if params[:mentorship].present?
        @developers = @developers.where(available_for_collaboration: true) if params[:collaboration].present?
    end

    def new
        puts "Current user: #{current_user.inspect}" # This should output `nil` if no one is signed in
        @developer = current_user.build_developer
    end

    def create
      @developer = current_user.build_developer(developer_params)
      if @developer.save
        redirect_to developers_path, notice: 'Developer profile created successfully!'
      else
        Rails.logger.error(@developer.errors.full_messages) # Log validation errors
        render :new, alert: 'Something went wrong. Please try again.'
      end
    end

      # Show the profile page
    def show
      @developer = Developer.find(params[:id])
    end

  # Edit the profile page
    def edit
      authorize_edit_access
    end

  # Update the profile page
  def update
    authorize_edit_access
    
    if @developer.update(developer_params)
      redirect_to @developer, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end
        
  private

  def set_developer
    @developer = current_user.developer
  end
    
  def developer_params
    params.require(:developer).permit(:name, :profile_picture, :headline, :key_skills, :city, :country, :experience_years, :available_for_mentorship, :available_for_collaboration, :email, :contact_info, :social_media_links, :degree, :institution, :graduation_date, :job_position, :company, :duration, :responsibilities, :project_description, :live_demo_link, :project_screenshot)
  end

  def authorize_edit_access
    unless @developer.user == current_user
      flash[:alert] = "You are not authorized to edit this profile."
      redirect_to @developer
    end
  end

  end
  