module Fullslate

  class Event
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
                :recurrence,
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

      if @id.nil?
        raise Fullslate::ClientNotFound
      end
    end
  end

end
