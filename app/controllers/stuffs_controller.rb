class StuffsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: :show
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]

  # GET /stuffs
  # GET /stuffs.json
  def index
    @stuffs = Stuff.all
    @categories = Category.all
    @comments = Comment.all
  end

  # GET /stuffs/1
  # GET /stuffs/1.json
  def show
    @comments = Comment.where(stuff_id: @stuff.id).order(created_at: :desc)
    session[:stuff_id]  = @stuff.id
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
    @comment = Comment.new
  end

  # GET /stuffs/1/edit
  def edit
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.slug = slugger(@stuff.title)

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to @stuff, notice: 'Stuff was successfully created.' }
        format.json { render :show, status: :created, location: @stuff }
      else
        format.html { render :new }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffs/1
  # PATCH/PUT /stuffs/1.json
  def update
    respond_to do |format|
      if @stuff.update(stuff_params)
         @stuff.slug = slugger(@stuff.title)
         @stuff.update(stuff_params)
        format.html { redirect_to @stuff, notice: 'Stuff was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuff }
      else
        format.html { render :edit }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    @stuff.destroy
    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: 'Stuff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tagged
    @stuff = Stuff.tagged_with(params[:tag])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuff
      @stuff = Stuff.find_by_slug(params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuff_params
      params.require(:stuff).permit(:title, :price, :old_price, :short_description, :full_description,
                                    :preview_image, :in_stock, :slug, :tag_list)
    end

    def slugger(title)
      Russian.translit(title).parameterize.truncate(80, omission: '')
    end
end
