class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize
        @@all << self
    end


    def self.all
        @@all
    end

    def cults
        BloodOath.all.map{|oath| oath.cult if oath.follower == self}.reject{|x|x==nil} #cleaner way to do this?
    end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.of_a_certain_age(age)
        self.all.select{|fol| fol.age >= age}
    end

    def my_cults_slogans
        self.cults.each{|cult| puts cult.slogan}
    end

    def self.most_active
        @@all.max_by{|follower| follower.cults.length}
    end

    def self.top_ten
        @@all.sort_by{|follower| follower.cults.length}.reverse[0..10]
    end
end