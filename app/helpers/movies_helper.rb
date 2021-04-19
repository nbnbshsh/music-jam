module MoviesHelper
  def movie_lists(movies)
    html = ''
    movies.each do |movie|
      html += render(partial: 'movie',locals: { movie: movie })
    end
    return raw(html)
  end
end
