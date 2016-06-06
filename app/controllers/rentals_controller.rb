class RentalsController < ApplicationController
  
  def index
    @rental = Rental.all
    @book=Book.new
  end

  def new
    @book = Book.new
    @rental = Rental.new
  end

  def create
    @book = Book.find(params[:id])
    if @book.Rental_id.nil?
      @rental = Rental.new(rental_date: DateTime.now)
      @rental.User = current_user
      @rental.Book = @book
      if @rental.save
        @book.increment(:rental_count)
        @book.Rental_id = @rental.id
        @book.save
        redirect_to rentals_path
      else
        render 'new'
      end
    else
      redirect_to books_path, notice: "その本はすでに貸出中です。"
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.Book.update(Rental_id: nil)
    @rental.destroy
    redirect_to rentals_path
  end
  
  def get_info
    @book=Book.find(1)
    info = {'Title' => @book.title,
            'Author' => @book.author,
            'Manufacturer' => @book.manufacturer,
            'Id' => @book.id
            }
    render json: info
  end

end