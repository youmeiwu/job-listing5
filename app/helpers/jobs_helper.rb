module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      "(hide)"
    else
      "(public)"
    end
  end
end
