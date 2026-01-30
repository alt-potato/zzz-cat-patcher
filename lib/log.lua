local lib = {}

---@alias log_level "TRACE" | "DEBUG" | "INFO" | "WARN" | "ERROR"
local log_levels = {
	TRACE = 0,
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4,
}

---Converts a log level to an integer.
---@param level string | integer
---@return integer
lib.convert_log_level = function(level)
	if type(level) == "string" then
		return log_levels[level]
	elseif type(level) == "number" then
		if level < 0 then
			return log_levels.TRACE
		elseif level > 4 then
			return log_levels.ERROR
		end

		return level
	end

	return log_levels[level] or log_levels.TRACE
end
lib.log_level = log_levels.INFO

---Prints a log message at the given log level.
---@param level log_level
---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.logl = function(level, message, override)
	if lib.convert_log_level(level) >= lib.log_level or override then
		log("[" .. level .. "] " .. message)
	end
end

---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.trace = function(message, override)
	lib.logl("TRACE", message, override)
end
---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.debug = function(message, override)
	lib.logl("DEBUG", message, override)
end
---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.info = function(message, override)
	lib.logl("INFO", message, override)
end
---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.warn = function(message, override)
	lib.logl("WARN", message, override)
end
---@param message string
---@param override? boolean -- Whether to override the log level and print the message regardless
lib.error = function(message, override)
	lib.logl("ERROR", message, override)
end

return lib
