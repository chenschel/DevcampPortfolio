# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :portfolio, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'

  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :sort] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value[:id]).update!(position: value[:position])
    end

    head :ok
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolio_show_path(@portfolio), notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolio_show_path(@portfolio), notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show; end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end

  def portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
