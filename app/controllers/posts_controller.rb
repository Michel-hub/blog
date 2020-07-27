class PostsController < ApplicationController

  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

  def index
    @posts = Post.order("created_at DESC")
  end

  def dashboard
  end

  def create

    temp_content = params[:content].upcase.gsub! 'SPOILER', ''

    @post = Post.create(
      title: params[:title],
      image_url: params[:image_url],
      content: temp_content
    )

  if @post.save
    redirect_to root_path, notice: 'guardado con exito'
  else 
    redirect_to root_path, notice: 'fallo la carga'
  end


  end
end
