class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :update, :destroy]
  before_action :get_dish, only: [:edit]
  skip_before_action :check_app_auth
  # skip_before_action :verify_authenticity_token

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
    # @dishes = Dish.where(user: @current_user)
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
    @dish.user = @current_user
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @dish.user = @current_user

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish_ingredient }
        # format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        # format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to edit_dish_path(@dish) }
        format.json { render :edit, status: :ok, location: @dish }
        flash[:notice] = 'Dish was successfully updated.'
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def get_dish
      @dish = Dish.find(params[:id])
      if (@dish.user != @current_user) && !(user_admin?)
        redirect_to dish_path(@dish)
        flash[:danger] = 'У вас недостаточно прав!'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :time_cook, :instruction, :category_id, :user_id,
        dish_ingredients_attributes: [:_destroy, :dish_id, :ingredient_id, :how_many, :measure, :id,
          ingredient_attributes: [:id, :short_descr, :_destroy]
        ] 
      )
    end
end
