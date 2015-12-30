(function ($) {
	Cortado.hover = function () {
		return {
			wakeFrom: function (container) {
				$(container).mouseenter(
					function (e) {
                		$jq(this).addClass('hover');
					}).mouseleave(
					function (e) {
                		$jq(this).removeClass('hover');
					}
				);
			}
		};
	};
})(jQuery);