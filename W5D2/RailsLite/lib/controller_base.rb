require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params)
    @req = req
    @res = res
    @params = params.merge(@req.params)
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double rendering detected!" if already_built_response?

    @res.status = 302
    @res.location = url
    session.store_session(@res)

    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double rendering detected!" if already_built_response?

    @res['Content-Type'] = content_type
    @res.write(content)
    session.store_session(@res)

    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.name.underscore

    path_to_file = "views/#{controller_name}/#{template_name}.html.erb"

    template_file = File.read(path_to_file)

    erb_template = ERB.new(template_file)

    content = erb_template.result(binding)

    render_content(content, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    router = Router.new
    router.send(name)
    render(name) unless already_built_response?
  end
end
