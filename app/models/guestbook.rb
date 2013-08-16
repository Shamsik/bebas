module Guestbook

  class Guestbook < ActiveRecord::Base
    resourcify
    
    validates :message, :presence => true, :length => { :minimum => 5, :maximum => 250 }
  
    include Gravtastic
      gravtastic

  end

end
