module Command
  class Repository
    def self.register(name : String, command : Command::Base)
      commands[name] = command
    end

    def self.list
      commands.map do |name, command|
        "#{name}\t\t\t#{command.description}"
      end.join("\n")
    end

    def self.[](name)
      commands[name]
    rescue KeyError
      puts "#{name} is not a valid command."
      return self["help"]
    end

    private def self.commands
      @@commands ||= {} of String => Command::Base
    end
  end
end
