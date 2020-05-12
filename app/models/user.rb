class User < ActiveRecord::Base
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :stores
  has_many   :payments

  validates :doc_number, uniqueness: true, presence: true

  before_save :format_doc

  def generate_new_authentication_token
    token = User.generate_unique_secure_token
    update_attributes authentication_token: token
  end

  def serialize
    UserSerializer.new(self).to_hash
  end

  def validate_cpf_cnpj
    CPF.valid?(self.doc_number) || CNPJ.valid?(self.doc_number)
  end

  private

  def format_doc
    self.doc_number.count('0-9') == 11 ? format_cpf : format_cnpj
  end

  def format_cpf
    self.doc_number = CPF.new(self.doc_number).formatted
  end

  def format_cnpj
    self.doc_number = CNPJ.new(self.doc_number).formatted
  end
end
