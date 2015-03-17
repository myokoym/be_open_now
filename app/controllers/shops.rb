BeOpenNow::App.controllers :shops do
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do
    now_time = Time.now
    # TODO: select in SQL
    # TODO: support holiday
    @shops = Shop.all.select do |shop|
      shop.bithour[24 * now_time.wday + now_time.hour] == "1"
    end
    render "shops/index"
  end

  get :show, :with => :id do
    @shop = Shop.find_by_id(params[:id])
    render "shops/show"
  end

  helpers do
    def open?(now, opening, closing)
      return false unless opening

      normalized_now = normalize_time(now)
      normalized_opening = normalize_time(opening)
      normalized_closing = normalize_time(closing)

      normalized_now > normalized_opening &&
        normalized_now < normalized_closing
    end

    def normalize_time(time_str)
      time_str.split(":").map {|n| sprintf("%02d", n.to_i)}.join(":")
    end
  end
end
