class ListsController < ApplicationController
  before_action :set_list, only: %i[ show update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
    @bookmark = Bookmark.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  # def edit
  # end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  # def update
  #   respond_to do |format|
  #     if @list.update(list_params)
  #       redirect_to list_path(@list), notice: "List was successfully updated."

  #     else
  #       render :edit, status: :unprocessable_entity
  #     end
  #   end
  # end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    redirect_to lists_url, notice: "List was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :photo)
    end
end
