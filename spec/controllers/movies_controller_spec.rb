require 'rails_helper'

describe MoviesController do
  
  describe 'add director' do
    before :each do
      @fake_movie = double('Movie', :title => "Some Film", :director => "Some Director", :id => "123")
      allow(Movie).to receive(:find).with("123").and_return(@fake_movie)
      allow(@fake_movie).to receive(:update_attributes!).and_return(true)
    end
    
    it 'should update attributes and show movie' do
      put :update, { :movie => { :stuff => "XX"},  :id => "123" }
      expect(response).to redirect_to(movie_path(@fake_movie))
    end
  end
  
  describe 'similar action' do
    it 'should generate route for similar movies' do
      expect(:get => similar_movie_path(123)).to route_to(:controller => "movies", :action => "similar", :id => "123")
    end
  end

  describe 'create and destroy' do
    it 'should create a new movie' do
      @fake_movie = Movie.new(:title => "Some Film", :director => "Some Director", :id => "123")
#      allow(Movie).to receive(:create!).with("1").and_return(@fake_movie)
      expect(MoviesController).to receive(:create)
      post :create, { :movie => {:title => "wqwqwq"}, :id => "123" }
    end
  end
    
#    it 'should destroy a movie' do
#      m = mock(Movie, :id => "10", :title => "blah", :director => nil)
#      Movie.stub!(:find).with("10").and_return(m)
#      m.should_receive(:destroy)
#      delete :destroy, {:id => "10"}
#    end

  # describe 'add director' do
  #   before :each do
  #     @m=double('Movie', :title => "Star Wars", :director => "director", :id => "1")
  #     @m=Movie.new(:title => "Star Wars", :director => "director", :id => "1")
  #     Movie.stub(:find).with("1").and_return(@m)
  #   end
  #   it 'should call update_attributes and redirect' do
  #     put :update, {:id => "1", :movie => @m}
  #     response.should redirect_to(movie_path(@m))
  #   end
  # end

end
