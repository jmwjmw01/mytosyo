class Book < ActiveRecord::Base
    # 以下を追加
    has_one :Rental

    validates :title, :author, :manufacturer, :publication_date, :isbn, :book_code, presence: true
end