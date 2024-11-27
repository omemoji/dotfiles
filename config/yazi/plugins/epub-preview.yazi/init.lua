local M = {}

function M:peek()
	local cache = ya.file_cache(self)
	if not cache then
		return
	end

	if self:preload() == 1 then
		ya.image_show(cache, self.area)
		ya.preview_widgets(self, {})
	end
end

function M:seek() end

function M:preload()
	ya.err("huhu")
	local cache = ya.file_cache(self)
	if not cache or fs.cha(cache) then
		return 1
	end

	local size = math.min(PREVIEW.max_width, PREVIEW.max_height)

	-- First try to use `epub-thumbnailer` command
	local child, code = Command("epub-thumbnailer"):args({
		tostring(self.file.url),
		tostring(cache),
		tostring(size),
	}):spawn()

	if not child then
		-- If `epub-thumbnailer` command is not available, try to use `gnome-epub-thumbnailer` command
		child, code = Command("gnome-epub-thumbnailer"):args({
			tostring(self.file.url),
			tostring(cache),
			-- gnome-epub-thumbnailer does not need a size
		}):spawn()
		if not child then
			ya.err("spawn `gnome-epub-thumbnailer` command returns " .. tostring(code))
			return 0
		end
	end

	local status = child:wait()
	return status and status.success and 1 or 2
end

return M