(function() {
    var Saver;

    Saver = (function() {
        function Saver() {}

        Saver.prototype.itemSizeWidth = 11;
        Saver.prototype.itemSizeHeight = 13;

        Saver.prototype.boxes = [];
        Saver.prototype.colors = ["FFFFFF", "D08D61", "59B75C",
            "8485BC", "94C472", "DB3C40",
            "B43E92", "1AACA5"];
        Saver.prototype.words = [":", ";", "\\", "/", ".", "!", "?",
            "[", "]", "+", "-", "*", "&", "^",
            "(", ")", "#", "@", "&", "<", ">",
            "[", "]", "~"];

        Saver.prototype.start = function() {
            this.container = $('#screen');
            this.setSize();
            this.drawBoxes();
            this.intervalShowSymbol = setInterval(this.showSymbol, 200);
            this.intervalChangeSymbol = setInterval(this.changeSymbol, 4000);
            return true;
        };

        Saver.prototype.setSize = function() {
            var left, top;
            this.screenWidth = window.innerWidth;
            this.screenHeight = window.innerHeight;
            this.cols = Math.ceil(this.screenWidth / this.itemSizeWidth);
            if (this.cols % 2 === 1) {
                this.cols += 1;
            }
            this.rows = Math.ceil(this.screenHeight / this.itemSizeHeight);
            if (this.rows % 2 === 0) {
                this.rows += 1;
            }
            this.width = this.cols * this.itemSizeWidth;
            this.height = this.rows * this.itemSizeHeight;
            left = -(this.width - this.screenWidth) / 2;
            top = (this.height - this.screenHeight) / 2;
            $('#screen').css({
                '-webkit-mask-size': 'auto '+(this.screenHeight * 0.85)+'px',
                '-webkit-mask-position-y': ((this.screenHeight * 0.15) / 2)+'px'
            });
            return true;
        };

        Saver.prototype.drawBoxes = function() {
            var box, col, row, _i, _ref, _results, _color_current, _color_previous, _symbol_current, _symbol_previous;
            _results = [];
            _color_current = 1;
            _color_previous = 1;
            _symbol_current = 1;
            _symbol_previous = 1;
            for (row = _i = 1, _ref = this.rows; 1 <= _ref ? _i <= _ref : _i >= _ref; row = 1 <= _ref ? ++_i : --_i) {
                _results.push((function() {
                    var _j, _ref1, _results1;
                    _results1 = [];
                    for (col = _j = 1, _ref1 = this.cols; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; col = 1 <= _ref1 ? ++_j : --_j) {
                        box = document.createElement('div');
                        do {
                           _color_current = Math.floor(Math.random() * this.colors.length);
                           _symbol_current = Math.floor(Math.random() * this.words.length);
                        }
                        while (_color_current == _color_previous || _symbol_current == _symbol_previous);
                        _color_previous = _color_current;
                        _symbol_previous = _symbol_current;
                        box.classList.add('icon');
                        box.classList.add('hidden');
                        box.innerHTML = Saver.prototype.words[_symbol_current];
                        box.style.color = Saver.prototype.colors[_color_current];
                        _results1.push(this.container.append(box));
                    }
                    return _results1;
                }).call(this));
            }
            return _results;
        };
        
        Saver.prototype.showSymbol = function() {
            var boxes;
            boxes = $(".icon.hidden").get().sort(function(){ return Math.round(Math.random())-0.5 }).slice(0,200);
            console.log(boxes.length);
            if ( boxes.length == 0 ) {
                clearInterval(1);
                return true;
            } else {
                $(boxes).removeClass('hidden');
                return true;
            }
        };
        
        Saver.prototype.changeSymbol = function() {
            var boxes;
            boxes = $(".icon:not(.changing)").get().sort(function() { return Math.round(Math.random())-0.5 }).slice(0,400);
            $(boxes).each(function() {
                $(this).addClass("changing");
                $(this).fadeTo( "slow", 0, function() {
                    $(this).html(Saver.prototype.words[Math.floor(Math.random() * Saver.prototype.words.length)]);
                    $(this).css("color",Saver.prototype.colors[Math.floor(Math.random() * Saver.prototype.colors.length)]);
                });
                $(this).fadeTo( "slow", 1, function() {
                    $(this).removeClass("changing");
                });
            });
        };

        return Saver;

    })();

    new Saver().start();

}).call(this);
