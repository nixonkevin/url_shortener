class Short < ActiveRecord::Base
	  attr_accessible :long, :desc
  attr_accessor :desc

class Pony < ActiveRecord::Base
  # standard validation
  validates :homepage, :url => true

  # with allow_nil
  validates :homepage, :url => {:allow_nil => true}

  # with allow_blank
  validates :homepage, :url => {:allow_blank => true}
end

# # 
#   validates :long,
# 		:presence => true,
# 		:format => {
# 			:with => %r{\A https://},
# 			:message => "Only HTTP links allowed!"

# 		}
# # 
  def to_param
    if self.desc.nil?
      b36_id
    else
      "#{b36_id}/#{self.desc}"
    end
  end

  def b36_id
    self.id.to_i.to_s(36)
  end
end

