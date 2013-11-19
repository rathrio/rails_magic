class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
    render "form", :locals => { :title => "Create Store", :store => @store, :submit_button_name => "create" }
  end

  def show
    @store = Store.find params[:id]
  end

  def create
    store = Store.new store_params
    if store.save
      redirect_to stores_path
    else
      raise "STORE NOT VALID"
    end
  end

  def edit
    @store = Store.find params[:id]
    render "form", :locals => { :title => "Edit Store", :store => @store, :submit_button_name => "update" }
  end

  def update
    store = Store.find params[:id]
    if store.update_attributes store_params
      redirect_to stores_path
    else
      raise "STORE NOT VALID"
    end
  end

  def destroy
    store = Store.find params[:id]
    store.delete
    redirect_to stores_path
  end

  private

  def store_params
    params.require(:store).permit(:name, :plz)
  end
end
