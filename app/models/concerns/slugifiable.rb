module Slugable
  module InstanceMethods
    def slug
      @slug = self.name.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|i| i.slug == slug }
    end
  end
end
