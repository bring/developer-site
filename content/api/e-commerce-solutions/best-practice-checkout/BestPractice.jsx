import React, {useEffect, useState} from 'react'
import data from './data/bestPractices.json'
import BestPracticeItem from "./BestPracticeItem";

const BestPractice = () => {
    const [country, setCountry] = useState('norway')
    const [bestPractices, setBestPractices] = useState(data.norway.bestPractices)

    useEffect(() => {
        setBestPractices(data[country]?.bestPractices)
    }, [country])

    const handleCountryChange = (event) => {
        setCountry(event.target.value)
    }

    return (
        <section className="dev-docscontent__section flex flex-wrap align-ifs">
            <div className="dev-guide-l">
                <p className="text-heading">
                    Follow these seven easy steps to improve the presentation of our delivery options in your checkout.
                </p>
                <p className="text-heading">
                    If you need help implementing any of these steps, go visit our <a
                    href="https://www.mybring.com/shipping-guide/integration/checkout" target="_blank">Checkout tool</a>
                    or contact our <a href="mailto:checkout.implementering@posten.no">Checkout implementation team</a>.
                </p>
                <div className="mtl">
                    <label className="form__label">
                        Choose country
                        <select
                            className="form__control"
                            aria-label="Select country"
                            id="country-selector"
                            onChange={handleCountryChange}
                        >
                            <option value="norway">Norway</option>
                            <option value="sweden">Sweden</option>
                            <option value="denmark">Denmark</option>
                        </select>
                    </label>
                </div>
                {bestPractices.map((bp, index) => (
                    <BestPracticeItem key={index} bestPractice={bp}/>
                ))}
            </div>
        </section>
    )
}

export default BestPractice
