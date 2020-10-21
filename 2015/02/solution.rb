class Wrapper
  def total_paper
    presents.sum do |present|
      l, w, h = dimensions_for(present)
      areas = [l * w, w * h, h * l]
      2 * areas.sum + areas.min
    end
  end

  def total_ribbon
    presents.sum do |present|
      l, w, h = dimensions_for(present)
      x, y = [l, w, h].min(2)
      (x + x + y + y) + (l * w * h)
    end
  end

  private

  def presents
    File.read("input.txt").strip.lines
  end

  def dimensions_for(present)
    present.split("x").map(&:to_i)
  end
end

p Wrapper.new.total_paper
p Wrapper.new.total_ribbon
