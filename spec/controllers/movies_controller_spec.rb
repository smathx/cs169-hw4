require 'rails_helper'

describe MoviesController do

  describe "show action" do
    before :each do
      @fake_movie = double('Movie', :id => "123", :title => "Some Movie")
      allow(Movie).to receive(:find).with("123").and_return(@fake_movie)
    end
    
    it "should show a movie" do
      get :show, :id => "123"
      expect(response).to render_template("show")
    end
  end
  
  describe "edit action" do
    before :each do
      @fake_movie = double('Movie', :id => "123", :title => "Some Movie")
      allow(Movie).to receive(:find).with("123").and_return(@fake_movie)
    end
    
    it "should allow movie date to be changed" do
      get :edit, :id => "123"
      expect(response).to render_template("edit")
    end
  end
  
  describe "new action" do
    it "should show form for new movie" do
      get :new
      expect(response).to render_template("new")
    end
  end
  
  describe 'update action' do
    before :each do
      @fake_movie = double('Movie', :title => "Some Film", :id => "123")
      allow(Movie).to receive(:find).with("123").and_return(@fake_movie)
    end
    
    it 'should update and show movie' do
      expect(@fake_movie).to receive(:update_attributes!)
      put :update, { :movie => { :title => "Whatever"},  :id => "123" }
      expect(response).to redirect_to(movie_path(@fake_movie))
    end
  end
  
  describe 'create action' do
    it 'should create a new movie' do
      @fake_movie = double(:title => "Some Film", :director => "Some Director", :id => "123")
      #allow(Movie).to receive(:create!).with("123").and_return(@fake_movie)
      #expect(controller).to receive(:create)
      post :create, { :movie => {:id => "123"} }
      expect(response).to redirect_to(movies_path)
    end
  end
    
  describe 'destroy action' do
    before :each do
      @fake_movie = double('Movie', :id => "123", :title => "Some Movie")
      allow(Movie).to receive(:find).with("123").and_return(@fake_movie)
    end
    
    it 'should destroy a movie' do
      expect(@fake_movie).to receive(:destroy)
      delete :destroy, {:id => "123"}
      expect(response).to redirect_to(movies_path)
    end
  end
  
  describe 'similar action' do
    it 'should generate route for similar movies' do
      expect(:get => similar_movie_path(123)).to route_to(:controller => "movies", :action => "similar", :id => "123")
    end
  end

end
