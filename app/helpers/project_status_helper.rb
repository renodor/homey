# frozen_string_literal:true

module ProjectStatusHelper
  def project_status_tag(status)
    content_tag(
      :span,
      status.tr('_', ' ').capitalize,
      class: ['text-xs', 'px-3', 'py-1', 'rounded-full', project_status_color(status)]
    )
  end

  def project_status_color(status)
    case status
    when 'to_do'
      'bg-gray-200'
    when 'in_progress'
      'bg-slate-300'
    when 'to_approve'
      'bg-orange-200'
    when 'done'
      'bg-green-200'
    else
      'bg-white'
    end
  end
end
