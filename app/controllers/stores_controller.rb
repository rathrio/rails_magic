class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
    render "new"
  end

  def show
    @store = Store.find params[:name]
  end

  def create
    store = Store.new
    store.name = params[:store][:name]
    store.plz = params[:store][:plz]
    if store.valid?
      store.save
      redirect_to "/stores"
    else
      raise "STORE NOT VALID"
    end
  end

  def edit
    @store = Store.find params[:name]
    render "edit"
  end

  def update
    store = Store.find params[:name]
    store.name = params[:store][:name]
    store.plz = params[:store][:plz]
    if store.valid?
      redirect_to "/stores"
    else
      raise "STORE NOT VALID"
    end
  end

  def destroy
    store = Store.find params[:name]
    store.delete
    redirect_to "/stores"
  end
end
