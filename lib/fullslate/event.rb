module Fullslate

  class Event
    API_PATH = '/events'
    attr_reader :id,
                :employee,
                :type,
                :at,
                :to,
                :end,
                :attendees,
                :services,
                :transactions,
                :global_id,
                :global_sequence,
                :deleted,
                :recur,
                #:recurrence,
                :tentative,
                :buffer_before,
                :buffer_after,
                :split_start,
                :split_length,
                :maximum_attendees,
                :provider_notes,
                :client_notes,
                :custom_fields,
                :title,
                :no_show

    def initialize(params)
      @id = params["id"]
      @employee = params["employee"]
      @type = params['type']
      @at = params['at']
      @to = params['to']
      @end = params['end']
      @attendees = params['attendees']
      @services = params['services']
      @transactions = params['transactions']
      @global_id = params['global_id']
      @global_sequence = params['global_sequence']
      @deleted = params['deleted']
      @recur = params['recur']
      @recurrence = parse_recurrence(params['recurrence'])
      @tentative = params['tentative']
      @buffer_before = params['buffer_before']
      @buffer_after = params['buffer_after']
      @split_start = params['split_start']
      @split_length = params['split_length']
      @maximum_attendees = params['maximum_attendees']
      @provider_notes = params['provider_notes']
      @client_notes = params['client_notes']
      @custom_fields = params['custom_fields']
      @title = params['title']
      @no_show = params['no_show']

      if @id.nil?
        raise Fullslate::EventNotFound
      end
    end

    def occurrences(params)
      @recurrence.occurrences(params)
    end

    private

    def parse_recurrence(str)
      return nil if str.nil?

      begin
        return RiCal.parse_string(str)[0]
      rescue Exception => e
        return RiCal.parse_string("BEGIN:VEVENT\n#{str}\nEND:VEVENT")[0]
      end
    end
  end

end
