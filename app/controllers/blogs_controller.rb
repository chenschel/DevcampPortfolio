# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :topics, only: [:index, :show, :new, :edit, :create, :update, :topic]
  layout 'blog'

  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status] }, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = if logged_in?(:site_admin)
               Blog.page(params[:page]).per(2)
             else
               Blog.published.by_created_at.page(params[:page]).per(2)
             end
    @page_title = 'My Portfolio Blog'
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: 'You are not authorized'
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit; end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to @blog, notice: 'Blog status was updated.'
  end

  # rubocop:disable AbcSize
  def topic
    topic = Topic.find(params[:topic_id])

    @blogs = if logged_in?(:site_admin)
               topic.blogs.page(params[:page]).per(2)
             else
               topic.blogs.published.by_created_at.page(params[:page]).per(2)
             end

    render :index
  end
  # rubocop:enable AbcSize

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def topics
    @topics = Topic.by_title
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end
end
