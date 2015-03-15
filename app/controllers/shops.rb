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
    now_str = now_time.strftime("%H:%M")
    # TODO: select in SQL
    # TODO: support holiday
    # TODO: support mos (-25:30)
    @shops = Shop.all.select do |shop|
      case now_time.wday
      when 0
        open?(now_str,
              shop.sunday_opening_time,
              shop.sunday_closing_time)
      when 6
        open?(now_str,
              shop.saturday_opening_time,
              shop.saturday_closing_time)
      else
        open?(now_str,
              shop.sunday_opening_time,
              shop.sunday_closing_time)
      end
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

      now > opening &&
        now < closing
    end
  end
end
