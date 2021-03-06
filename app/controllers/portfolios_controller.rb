class PortfoliosController < ApplicationController
  layout "portfolio"
  
  def index
    @portfolio_items = Portfolio.all
  end

  def jekyll
    @jekyll_portfolio_items = Portfolio.jekyll
  end

  def sass
    @sass_portfolio_items = Portfolio.sass
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end


  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    # eliminate the record
    @portfolio_item.destroy
    respond_to do |format|
      # redirect after deleting
      format.html { redirect_to portfolios_url, notice: 'Item was successfully deleted.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
  end
end
