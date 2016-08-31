require 'ruby-progressbar'

module Enumerable
  def each_with_progress(opts={}, &block)
    if self.respond_to? :length
      opts = {
        starting_at: 0,
        total: self.length,
        format: '%c/%C (%p%%) [%B] %a  %e'
      }.merge(opts)
    else
      opts = {
        starting_at: 0,
        total: nil,
        format: '%c [%B] %a'
      }.merge(opts)
    end
    bar = ProgressBar.create(opts)

    ret = self.each do |item|
      block.(item)
      bar.increment
    end

    bar.stop

    ret
  end
end
