class Fb
  class << self
    def get_likes
      @graph = Koala::Facebook::API.new("CAACEdEose0cBALX8QZBra0m2OUE6aBuBsbfFd0bSrKOpBkTObpKerikRTLpvonMZCRZCOPJq0xIBtkQruC4H1irWIzy8aZBjcZA0RZAegZBZAU9vOBuv0wT9AhfIKTOoQuqrnieZCqaKgcgCmOoL0VmFLyWkZBhLfRQBoZD")
      like_data = @graph.get_object("661049043910936/likes")
      likes = Array.new
      until(like_data.nil?)
        like_data.each do |like|
          likes << like
        end
        like_data = like_data.next_page
      end
      likes
    end
  end
end