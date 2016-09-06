Spree::Admin::ReportsController.class_eval do

  def initialize
    super
    Spree::Admin::ReportsController.add_available_report!(:sales_total)
    Spree::Admin::ReportsController.add_available_report!(:historical_report)
  end

  def historical_report
    params[:q] = {} unless params[:q]

    if params[:q][:date_gt].blank?
      params[:q][:date_gt] = Time.zone.now.beginning_of_month
    else
      params[:q][:date_gt] = Time.zone.parse(params[:q][:date_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
    end

    if params[:q] && !params[:q][:date_lt].blank?
      params[:q][:date_lt] = Time.zone.parse(params[:q][:date_lt]).end_of_day rescue ""
    end

    params[:q][:s] ||= "date asc"

    @search = Spree::OutOfStock.ransack(params[:q])
    @out_of_stocks = @search.result

    @totals = {}
    @out_of_stocks.each do |out_of_stock|
      @totals[out_of_stock.variant.sku] = {}
      @totals[out_of_stock.variant.sku][:date] = out_of_stock.date
      @totals[out_of_stock.variant.sku][:url] = admin_product_path out_of_stock.variant.product.master
    end

  end


end
