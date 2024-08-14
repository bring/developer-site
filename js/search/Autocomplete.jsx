import { autocomplete } from '@algolia/autocomplete-js';
import React, { createElement, Fragment, useEffect, useRef } from 'react';
import { createRoot } from 'react-dom/client';

export function Autocomplete(props) {
  const containerRef = useRef(null);
  const panelRootRef = useRef(null);
  const rootRef = useRef(null);

  useEffect(() => {
    if (!containerRef.current) {
      return undefined;
    }

    const search = autocomplete({
      container: containerRef.current,
      panelContainer: containerRef.current,
      renderer: { createElement, Fragment, render: () => {} },
      render({ children }, root) {
        if (!panelRootRef.current || rootRef.current !== root) {
          rootRef.current = root;

          panelRootRef.current?.unmount();
          panelRootRef.current = createRoot(root);
        }

        panelRootRef.current.render(children);
      },
      ...props,
    });

    const labelValue = "Search documentation"
   
    // add aria-label to the combo-box in order to get info about the search before entering it as well
    containerRef.current.querySelector(".aa-Autocomplete").setAttribute("aria-label", labelValue)
    
    // change value of aria-label provided by algolia
    containerRef.current.querySelector(".aa-Label").setAttribute('aria-label', labelValue)

    return () => {
      search.destroy();
    };
  }, [props]);

  return <div ref={containerRef} />;
}