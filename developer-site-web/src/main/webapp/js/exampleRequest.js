(function($) {
    var tab = "    ";
    var options = {}
    var responseElement;
    
    var methods = {
        init: function(optionsArg) {
            $.extend(options, optionsArg);
            responseElement = $(".response", this);
            if (responseElement.hasClass("xml")) {
                methods.performXmlRequest(responseElement, $(".request", this).attr("data-internal"));
            }
            if (responseElement.hasClass("html")) {
                methods.performXmlRequest(responseElement, $(".request", this).attr("data-internal"));
            }
            else if (responseElement.hasClass("json")) {
                methods.performJsonRequest(responseElement, $(".request", this).attr("data-internal"));
            }
        },
            
        repeatString: function(content, repetitions) {
            var output = "";
            for (var i = 0; i < repetitions; i++) {
                output += content;
            }
            return output;
        },
        
        startTag: function(element) {
            var attributeStr = methods.attributes(element);
            if (attributeStr.length > 0)
                attributeStr = " " + attributeStr;
            return "<" + element.tagName + attributeStr + ">";
        },
        
        endTag: function(element) {
            return "</" + element.tagName + ">";
        },
        
        attributes: function(element) {
            var output = "";
            if (element.attributes.length > 0) {
                output += methods.attribute(element.attributes.item(0));
            }
            for (var i = 1; i < element.attributes.length; i++) {
                output += " " + methods.attribute(element.attributes.item(i));
            }
            return output;
        },
        
        attribute: function(attrItem) {
            return attrItem.name+"="+'"'+escape(attrItem.value)+'"';  
        },
        
        textContent: function(element, level) {
            var text = $.trim(element.nodeValue);
            if (text.length == 0) {
                return text;
            }
            return methods.repeatString(tab,level) + text.replace("\n","\n"+methods.repeatString(tab,level)) + "\n";
        },
        
        comment: function(element) {
            return "<!--" + element.nodeValue + "-->";
        },
        
        cdata: function(element) {
            return "<![CDATA["+element.nodeValue+"]]>";
        },
         
        formatXml: function(root, level) {
            var indent = methods.repeatString(tab, level);
            var output = indent + methods.startTag(root) + "\n";
            $($(root).contents()).each(function() {
                switch (this.nodeType) {
                    case Node.ELEMENT_NODE:
                        output += methods.formatXml(this, level + 1);
                        break;
                    case Node.TEXT_NODE:
                        output += methods.textContent(this, level + 1);   
                        break;
                    case Node.COMMENT_NODE:
                        output += indent + methods.comment(this) + "\n";
                        break;
                    case Node.CDATA_SECTION_NODE:
                        output += indent + methods.cdata(this) + "\n";
                        break;
                }
            });
            output += indent + methods.endTag(root) + "\n";
            return output;
        },
        
        failedRequestCallback: function(responseElement, jqXHR, textStatus, errorThrown) {
            responseElement.text(jqXHR.responseText);
        },
        
        performXmlRequest: function(responseElement, urlArg) {
            $.ajax({
                url: urlArg,
                dataType: "xml",
                success: function(data, textStatus, jqXHR) {
                    var rootElement = $(data).children()[0];
                    var xmlText = methods.formatXml(rootElement, 0);
                    responseElement.text(xmlText);
                    responseElement.snippet("xml", {
                        style: "ide-eclipse"
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {methods.failedRequestCallback(responseElement, jqXHR, textStatus, errorThrown)}
            });
        },
        
        // TODO reformat JSON object (indentation)
        performJsonRequest: function(responseElement, urlArg) {
            $.ajax({
                url: urlArg,
                dataType: "json",
                success: function(data, textStatus, jqXHR) {
                    responseElement.text(formatJson(data));
                    responseElement.snippet("javascript", {
                        style: "ide-eclipse"
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {methods.failedRequestCallback(responseElement, jqXHR, textStatus, errorThrown)}
            });
        }
    }
    $.fn.exampleRequest = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist.');
        }   
    }
})(jQuery);