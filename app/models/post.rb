class Post < ActiveRecord::Base
     validates :name, {length: {maximum: 40}}
     validates :user_id, {presence: true}
     validates :date, uniqueness:  { scope: [:user_id, :menu] }
     
  def user
    return User.find_by(id: self.user_id)
  end
end
