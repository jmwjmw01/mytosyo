class BooksController < ApplicationController

  load_and_authorize_resource
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.image="http://images-jp.amazon.com/images/P/"+ @book.isbn + ".09.MZZZZZZZ"
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    if @book.Rental_id.nil?
      @book.destroy
      redirect_to books_path
    else
      redirect_to books_path, notice: "その本は貸出中のため削除できません。"
    end
  end
  
  def get_info
    Amazon::Ecs.debug = true
    res = Amazon::Ecs.item_search(params[:isbn],
         :search_index   => 'Books',
         :response_group => 'Medium',
         :country        => 'jp'
       )
    info = {'Title' => res.first_item.get('ItemAttributes/Title'),
            'Author' => res.first_item.get('ItemAttributes/Author'),
            'Manufacturer' => res.first_item.get('ItemAttributes/Manufacturer'),
            'Publication_Date' => res.first_item.get('ItemAttributes/PublicationDate')
            }
    render json: info
  end

  def search
	   @cond = params[:search_cond]
     @books = Book.where('title like ?', '%' + @cond + '%') if user_id.presence?
       respond_to do |format|
        format.html
        format.json { render json: @books }
       end
     
  end 
  
  private

    def book_params
      params[:book].permit(:title, :author, :manufacturer, :publication_date, :isbn, :book_code)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
