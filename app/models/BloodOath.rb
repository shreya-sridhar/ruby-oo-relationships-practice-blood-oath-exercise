class BloodOath
    attr_accessor :cult, :follower
    attr_reader :initiation_date

    @@all = []

    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = Time.now.strftime("%Y/%m/%d")
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all.min_by{|oath| oath.initiation_date}.follower
    end

end