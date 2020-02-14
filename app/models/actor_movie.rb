class ActorMovie <ApplicationRecord
    validates_presence_of :actor_id, :movie_id 
  
    belongs_to :actor
    belongs_to :movie
end 