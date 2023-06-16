import React from 'react'
import {Mybicon} from '@norwaypost/mybring-iconsystem'

const BestPracticeItem = ({bestPractice}) => {
    const {figures, h3, paragraphs, downloadLinks, tags, illustrationImageUrl, illustrationImageAlt} = bestPractice
    return (
        <div className="bw2 ba flex best-practice-item align-ic mtm b--gray2">
            <div className="flex-1">
                <div className="flex flex-dir-row justify-cc mbm">
                    {figures && figures.map(figure => (
                        <figure key={figure.imageAlt}>
                            <img src={figure.imageUrl} alt={figure.imageAlt} className={figure.imageClass}/>
                        </figure>
                    ))}
                </div>
                <h3 className="fwn">{h3}</h3>
                {paragraphs && paragraphs.map((p, index) => (
                    <div key={index} dangerouslySetInnerHTML={{__html: p}}></div>
                ))}
                <div className="flex flex-dir-row justify-cc mtl mbm">
                    {downloadLinks && downloadLinks.map((link, index) => (
                        <a key={index} href={link.href} className="btn-link--dark mrm" download={link.name}>
                            <span className="mrs">
                                <Mybicon
                                    name="mybicon-download_file"
                                    iconTitle="Download logo"
                                    width={16}
                                    height={16}
                                />
                            </span>
                            <span>{link.linkText}</span>
                        </a>
                    ))}
                </div>
                <div className="flex flex-wrap gas">
                    {tags && tags.map((tag, index) => (
                        <span className="mb-badge" key={index}>{tag}</span>
                    ))}
                </div>
            </div>
            <figure className="mlxl flex-1 best-practice-item--illustration">
                <img src={illustrationImageUrl} alt={illustrationImageAlt} className="maxw48r"/>
            </figure>
        </div>
    )
}

export default BestPracticeItem
