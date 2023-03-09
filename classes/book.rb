require_relative './item'
class Book < Item
    attr_accessor :publisher, :cover_state
    
    def initialize(publisher, cover_state, publish_date)
        super(publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end

    def to_json(*_args)
        {
          'publisher' => @publisher,
          'cover_state' => @cover_state,
          'publish_date' => @publish_date,
          'class' => self.class.name
        }
      end

    def can_be_archived(self):
        if self.cover_state == "bad":
            return True
        return super().can_be_archived()
    end
end
