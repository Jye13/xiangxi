module WaybillsHelper
  def show_waybill_status(status)
    case status
    when 0
      '初始'
    when 1
      '进行中'
    when 2
      '已完成'
    end
  end
end
