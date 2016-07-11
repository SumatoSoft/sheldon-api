require 'open4'

module Classifier
  class DataParser
    class << self
      def query(query)
        Rails.logger.info query
        output = nil
        Open4::popen4("bash -l -c '/home/sheldon/anaconda2/bin/python #{ENV['PYTHON_FILE_PATH']}/sumatobot_ready.py \"#{query}\"'") do |pid, stdin, stdout, stderr|
          output = stdout.read.strip
          Rails.logger.info "pid        : #{pid}"
          Rails.logger.info "stdout     : #{output}"
          Rails.logger.info "stderr     : #{stderr.read.strip}"
        end
        item = parse(output)
        item
        # query.mb_chars.try(:downcase!).to_s
      end

      def parse(output)
        return '' if output.blank?
        output.split("\n")[1].delete("[]\'")
      end
    end
  end
end
