require_relative "../screen_generator"

module Screen
  class AnyoneGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)
    class_option :doc, type: :boolean, default: false, desc: "Include documentation."

    def generate_sections
      generate_section("anyone", anyone_class_name)
      generate_section("details", details_class_name)
      add_enum_to_member

      puts <<~MESSAGE
        Done generating the #{anyone_class_name} and #{details_class_name} screens!

        Be sure to add the following controllers in the desired application order in `form_navigation.rb`:

        #{anyone_class_name}Controller,
        #{details_class_name}Controller,

        You'll also need to generate any required migrations manually.
        ```
          add_column :interviews, :#{anyone_model_method}, :integer, default: 0
        ```
      MESSAGE
    end

    private

    def model_name
      name.camelcase
    end

    def model_method
      name.underscore
    end

    def anyone_class_name
      "Anyone#{model_name}"
    end

    def anyone_model_method
      "anyone_#{model_method}"
    end

    def details_class_name
      "#{model_name}Details"
    end

    def generate_section(template_directory, section_name)
      generate_form_model(template_directory, section_name)
      generate_form_model_spec(template_directory, section_name)
      generate_form_controller(template_directory, section_name)
      generate_form_controller_spec(template_directory, section_name)
      generate_form_view(template_directory, section_name)
    end

    def add_enum_to_member
      inject_into_file "app/models/interview.rb",
        before: "  # Generated enums added above\n" do
          "  enum #{anyone_model_method}: { unfilled: 0, yes: 1, no: 2 }, _prefix: :#{anyone_model_method}\n"
        end
    end

    def generate_form_model(template_directory, model_name)
      template "#{template_directory.underscore}/form_model.template",
        "app/forms/#{model_name.underscore}_form.rb"
    end

    def generate_form_model_spec(template_directory, model_name)
      template "#{template_directory.underscore}/form_model_spec.template",
        "spec/forms/#{model_name.underscore}_form_spec.rb"
    end

    def generate_form_controller(template_directory, model_name)
      template "#{template_directory.underscore}/form_controller.template",
        "app/controllers/#{model_name.underscore}_controller.rb"
    end

    def generate_form_controller_spec(template_directory, model_name)
      template "#{template_directory.underscore}/form_controller_spec.template",
        "spec/controllers/#{model_name.underscore}_controller_spec.rb"
    end

    def generate_form_view(template_directory, model_name)
      template "#{template_directory.underscore}/form_view.template",
        "app/views/#{model_name.underscore}/edit.html.erb"
    end
  end
end
