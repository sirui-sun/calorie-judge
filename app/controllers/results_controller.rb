class ResultsController < ApplicationController
  # GET /results
  # GET /results.json

  def home
  end

  def index
    @results = Result.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
    @thfoods = Food.all.select { |x| x.calorie == 200 }
    @otherfoods = Food.all.select { |x| x.calorie != 200 } 
    @foods = (@thfoods.shuffle[0..1] + @otherfoods.shuffle[0..7]).shuffle

    respond_to do |format| 
      format.html
      format.js
    end
  end

  def addResult
    @result = Result.find(params[:id])
    @result.update_attributes(:result => params[:result])
    render :text => '', :status => 204
  end

  def retry
    @result = Result.new(params[:result])
    if @result.save
      redirect_to :action => "edit", :id => @result.id
    end
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(params[:result])

    respond_to do |format|
      if @result.save
        format.html { redirect_to :action => "edit", :id => @result.id }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end
end
